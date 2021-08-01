from PIL import Image


def rgb2hex(r, g, b):
    return '0x{:02x}{:02x}{:02x}'.format(r, g, b)


im = Image.open(input("Enter file name:"))
image = list(im.getdata())

hex_image = []
for pixel in image:
    hex_image.append(rgb2hex(*pixel))

print(', '.join(hex_image))
