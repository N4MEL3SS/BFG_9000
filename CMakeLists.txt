cmake_minimum_required(VERSION 3.16)
project(BFG_9000 C)

set(CMAKE_C_STANDARD 99)
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror")

include_directories("includes/")
include_directories("mlx/mlx_linux")
set(SRC_LIST srcs/main.c srcs/close.c srcs/image.c)
set(HEAD_LIST includes/game.h)

set(MLX_LINUX ${CMAKE_CURRENT_SOURCE_DIR}/mlx/mlx_linux/)
set(MLX_HEAD_LIST ${MLX_LINUX}/mlx.h ${MLX_LINUX}/mlx_int.h)

set(MLX ${MLX_LINUX}/mlx.h
		${MLX_LINUX}/mlx_int.h
		${MLX_LINUX}/mlx_clear_window.c
		${MLX_LINUX}/mlx_destroy_display.c
		${MLX_LINUX}/mlx_destroy_image.c
		${MLX_LINUX}/mlx_destroy_window.c
		${MLX_LINUX}/mlx_expose_hook.c
		${MLX_LINUX}/mlx_ext_randr.c
		${MLX_LINUX}/mlx_flush_event.c
		${MLX_LINUX}/mlx_get_color_value.c
		${MLX_LINUX}/mlx_get_data_addr.c
		${MLX_LINUX}/mlx_hook.c
		${MLX_LINUX}/mlx_init.c
		${MLX_LINUX}/mlx_int_anti_resize_win.c
		${MLX_LINUX}/mlx_int_do_nothing.c
		${MLX_LINUX}/mlx_int_get_visual.c
		${MLX_LINUX}/mlx_int_param_event.c
		${MLX_LINUX}/mlx_int_set_win_event_mask.c
		${MLX_LINUX}/mlx_int_str_to_wordtab.c
		${MLX_LINUX}/mlx_int_wait_first_expose.c
		${MLX_LINUX}/mlx_key_hook.c
		${MLX_LINUX}/mlx_loop.c
		${MLX_LINUX}/mlx_loop_hook.c
		${MLX_LINUX}/mlx_mouse.c
		${MLX_LINUX}/mlx_mouse_hook.c
		${MLX_LINUX}/mlx_new_image.c
		${MLX_LINUX}/mlx_new_window.c
		${MLX_LINUX}/mlx_pixel_put.c
		${MLX_LINUX}/mlx_put_image_to_window.c
		${MLX_LINUX}/mlx_rgb.c
		${MLX_LINUX}/mlx_screen_size.c
		${MLX_LINUX}/mlx_set_font.c
		${MLX_LINUX}/mlx_string_put.c
		${MLX_LINUX}/mlx_xpm.c.ok
		${MLX_LINUX}/mlx_xpm.c)
#mlx/mlx_linux/mlx_lib_xpm.c

find_library(XEXT Xext ${X11_Xext_LIB})
message("Xext lib dir - ${XEXT}")

#add_library(mlx_linux STATIC ${MLX} ${MLX_HEAD_LIST})
#target_link_libraries(mlx_linux PUBLIC X11)
#target_link_libraries(mlx_linux PUBLIC ${XEXT})

find_library(MLX_LINUX_ORG mlx ${MLX_LINUX})
message("mlx lib dir - ${MLX_LINUX_ORG}")

add_executable(BFG_9000 ${SRC_LIST} ${HEAD_LIST})
target_link_libraries(BFG_9000 PUBLIC ${MLX_LINUX_ORG})
target_link_libraries(BFG_9000 PUBLIC X11)
target_link_libraries(BFG_9000 PUBLIC ${XEXT})
