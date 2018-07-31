import os
import ctypes

for d, dirs, files in os.walk('lib'):
    for f in files:
        if f.endswith('.a'):
            continue
        ctypes.cdll.LoadLibrary(os.path.join(d, f))

import pydicom
import numpy as np
import base64
import PIL.Image

def lambda_handler(event, context):
    ds = pydicom.dcmread("./explicit_ct_jpeg-lossless-nh_mono2.dcm")
    image_2d = ds.pixel_array
    image_2d_scaled = image_2d_scaled = (np.maximum(image_2d,0) / image_2d.max()) * 255.0
    image_2d_scaled = np.uint8(image_2d_scaled)
    PIL.Image.fromarray(image_2d_scaled).save("/tmp/hoge.png", bits=256, compress_level=0)

    return 'Hello from Lambda'

if __name__ == '__main__':
    lambda_handler("", "")
