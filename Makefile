NAME = bfg9000
OS = $(shell uname)

#	COMPILATIONS_FLAG
CC = clang
FLAGS = -Wall -Wextra -Werror
FRAME_LINUX = -lXext -lX11
FRAME_MAC = -framework OpenGL -framework AppKit

#	MLX_LIB
ifeq ($(OS), Linux)
	MLX = ./mlx/mlx_linux/
	MLX_LINK = -L $(MLX) -lmlx $(FRAME_LINUX)
else
	MLX = ./mlx/mlx_mac/
	MLX_LINK = -L $(MLX) -lmlx $(FRAME_MAC)
endif

#	HEADERS
INCLUDES = -I./includes/
INCLUDES_MLX = -I$(MLX)

#	SOURCE
SRCS_DIR = ./srcs/
SRCS_LIST = main.c image.c close.c
SRCS = $(addprefix $(SRCS_DIR), $(SRCS_LIST))

#	OBJECT_FILES
OBJS_DIR = ./objs/
OBJS_DIR_NAME = objs
OBJS_LIST = $(patsubst %.c, %.o, $(SRCS_LIST))
OBJS = $(addprefix $(OBJS_DIR), $(OBJS_LIST))

#	COLORS
GREEN = \033[0;32m
RED = \033[0;31m
RESET = \033[0m

all: make_mlx $(NAME)

make_mlx:
	@make -C $(MLX) all

$(NAME): $(OBJS_DIR) $(OBJS)
	$(CC) $(OBJS) $(MLX_LINK) -o $(NAME)
	@echo "$(GREEN) $(NAME) created. $(RESET)"

$(OBJS_DIR):
	@mkdir  -p $(OBJS_DIR_NAME)
	@echo "$(GREEN) Object files directory was created. $(RESET)"

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@$(CC) $(INCLUDES) $(INCLUDES_MLX) -c $< -o $@

clean:
	@rm -rf $(OBJS)
	@echo "$(RED) Object files were deleted. $(RESET)"

fclean: clean
	@rm -f $(NAME)
	@echo "$(RED) $(NAME) was deleted. $(RESET)"

re: clean fclean all

.PHONY: clean fclean re all
