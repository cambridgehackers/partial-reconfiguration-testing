/***************************************************************************

*   © Copyright 2013 Xilinx, Inc. All rights reserved. 

*   This file contains confidential and proprietary information of Xilinx,
*   Inc. and is protected under U.S. and international copyright and other
*   intellectual property laws. 

*   DISCLAIMER
*   This disclaimer is not a license and does not grant any rights to the
*   materials distributed herewith. Except as otherwise provided in a valid
*   license issued to you by Xilinx, and to the maximum extent permitted by
*   applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH
*   ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, 
*   EXPRESS, IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES
*   OF MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR 
*   PURPOSE; and (2) Xilinx shall not be liable (whether in contract or 
*   tort, including negligence, or under any other theory of liability)
*   for any loss or damage of any kind or nature related to, arising under
*   or in connection with these materials, including for any direct, or any
*   indirect, special, incidental, or consequential loss or damage (including
*   loss of data, profits, goodwill, or any type of loss or damage suffered 
*   as a result of any action brought by a third party) even if such damage
*   or loss was reasonably foreseeable or Xilinx had been advised of the 
*   possibility of the same. 

*   CRITICAL APPLICATIONS 
*   Xilinx products are not designed or intended to be fail-safe, or for use
*   in any application requiring fail-safe performance, such as life-support
*   or safety devices or systems, Class III medical devices, nuclear facilities,
*   applications related to the deployment of airbags, or any other applications
*   that could lead to death, personal injury, or severe property or environmental
*   damage (individually and collectively, "Critical Applications"). Customer
*   assumes the sole risk and liability of any use of Xilinx products in Critical
*   Applications, subject only to applicable laws and regulations governing 
*   limitations on product liability. 

*   THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT 
*   ALL TIMES.

***************************************************************************/

#include "hls_opencv.h"
#include "fast_corners.h"
#include "../common/image_utils.h"

using namespace cv;

extern void opencv_fast_corners(IplImage *src, IplImage *dst);
extern void hls_fast_corners(IplImage *src, IplImage *dst);

int main (int argc, char** argv)
{
    Mat src_rgb = imread(INPUT_IMAGE);
    Mat src_yuv(src_rgb.rows, src_rgb.cols, CV_8UC2);
    Mat dst_yuv(src_rgb.rows, src_rgb.cols, CV_8UC2);
    Mat dst_rgb(src_rgb.rows, src_rgb.cols, CV_8UC3);
    
    cvtcolor_rgb2yuv422(src_rgb, src_yuv);
    
    IplImage src = src_yuv;
    IplImage dst = dst_yuv;

    hls_fast_corners(&src, &dst);
    cvtColor(dst_yuv, dst_rgb, CV_YUV2BGR_YUYV);
    imwrite(OUTPUT_IMAGE, dst_rgb);

    opencv_fast_corners(&src, &dst);
    cvtColor(dst_yuv, dst_rgb, CV_YUV2BGR_YUYV);
    imwrite(OUTPUT_IMAGE_GOLDEN, dst_rgb);

    return image_compare(OUTPUT_IMAGE, OUTPUT_IMAGE_GOLDEN);
}
