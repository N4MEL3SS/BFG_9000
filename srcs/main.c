#include "game.h"

int main()
{
	t_mlx	mlx_val;

	mlx_val.k = 1;
	mlx_val.coff = 50;
	mlx_val.mlx = mlx_init();
	if (!mlx_val.mlx)
		exit(EXIT_FAILURE);
	mlx_val.win = mlx_new_window(mlx_val.mlx, WIDTH, HEIGHT, "game");
	mlx_val.image = new_image(&mlx_val);
	printf("%p\n", mlx_val.mlx);
//	draw(&mlx_val, mlx_val.coff);
	mlx_hook(mlx_val.win, 17, 0, close_win, &mlx_val.mlx);
	mlx_hook(mlx_val.win, 2, 0, close_esc, &mlx_val.mlx);
	mlx_hook(mlx_val.win, 2, 0, render, &mlx_val.mlx);
	mlx_loop(mlx_val.mlx);
	return (0);
}
