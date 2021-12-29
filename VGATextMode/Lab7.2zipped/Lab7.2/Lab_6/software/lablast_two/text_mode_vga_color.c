/*
 * text_mode_vga_color.c
 * Minimal driver for text mode VGA support
 * This is for Week 2, with color support
 *
 *  Created on: Oct 25, 2021
 *      Author: zuofu
 */

#include <system.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <alt_types.h>
#include "text_mode_vga_color.h"

void textVGAColorClr()
{
	for (int i = 0; i<(ROWS*COLUMNS) * 2; i++)
	{
		vga_ctrl->VRAM[i] = 0x00;
	}
}

void textVGADrawColorText(char* str, int x, int y, alt_u8 background, alt_u8 foreground)
{
	int i = 0;
	while (str[i]!=0)
	{
		vga_ctrl->VRAM[(y*COLUMNS + x + i) * 2] = foreground << 4 | background;
		vga_ctrl->VRAM[(y*COLUMNS + x + i) * 2 + 1] = str[i];
		i++;
	}
}

void setColorPalette (alt_u8 color, alt_u8 red, alt_u8 green, alt_u8 blue)
{
	//fill in this function to set the color palette starting at offset 0x0000 2000 (from base)

}

void textVGATest()
{

	//Register write and readback test
	alt_u32 checksum[ROWS], readsum[ROWS];
	printf("%x %x, %x, %x, \n", vga_ctrl->VRAM[0], vga_ctrl->VRAM[1], vga_ctrl->VRAM[2], vga_ctrl->VRAM[3]);
	for (int j = 0; j < ROWS; j++)
	{
		checksum[j] = 0;
		for (int i = 0; i < COLUMNS; i++)
		{
			vga_ctrl->VRAM[j*COLUMNS + i] = i + j;
			checksum[j] += i + j;
		}
	}
	for (int j = 0; j < ROWS; j++)
	{
		readsum[j] = 0;
		for (int i = 0; i < COLUMNS; i++)
		{
			readsum[j] += vga_ctrl->VRAM[j*COLUMNS + i];
//			printf ("%x \n\r", vga_ctrl->VRAM[j*COLUMNS + i]);
//			printf("Readsum %x, checksum %x", readsum[j], checksum[j]);
		}
		printf ("Row: %d, Checksum: %x, Read-back Checksum: %x\n\r", j, checksum[j], readsum[j]);
		if (checksum[j] != readsum[j])
		{
			printf ("Checksum mismatch!, check your Avalon-MM code\n\r");
			while (1){};
		}
	}


}


void textVGAColorScreenSaver()
{
	//This is the function you call for your week 2 demo
	char color_string[80];
    int fg, bg, x, y;
	textVGAColorClr();
	alt_u32 temp[8];
	alt_u32 red_, blue_, green_, red_next, blue_next, green_next;

	for (int i = 0; i < 8; i++){
		temp[i] = 0;
	}


	//initialize palette
	for (int i = 0; i < 8; i++)
	{
		red_ = colors[2*i].red;
		blue_ = colors[2*i].blue;
		green_ = colors[2*i].green;
		red_next = colors[2*i+1].red;
		blue_next = colors[2*i+1].blue;
		green_next = colors[2*i+1].green;

		temp[i] = temp[i] | red_next;
		temp[i] = temp[i] << 4;

		temp[i] = temp[i] | green_next;
		temp[i] = temp[i] << 4;


		temp[i] = temp[i] | blue_next;
		temp[i] = temp[i] << 4;


		temp[i] = temp[i] | red_;
		temp[i] = temp[i] << 4;


		temp[i] = temp[i] | (green_);

		temp[i] = temp[i] << 4;


		temp[i] = temp[i] | (blue_);

		temp[i] = temp[i] << 1;



		vga_ctrl->palette[i] = temp[i];
		printf("iteration %d: %x \n ", i, temp[i]);
	}


	while (1)
	{
		fg = rand() % 16;
		bg = rand() % 16;
		while (fg == bg)
		{
			fg = rand() % 16;
			bg = rand() % 16;
		}
		sprintf(color_string, "Drawing %s text with %s background", colors[fg].name, colors[bg].name);
		x = rand() % (80-strlen(color_string));
		y = rand() % 30;
		textVGADrawColorText (color_string, x, y, bg, fg);
		usleep (100000);
	}

	// start of set color palette

}
