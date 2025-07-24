import math
import os
def render_frame(A, B, x, y):
    cosA = math.cos(A)
    sinA = math.sin(A)
    cosB = math.cos(B)
    sinB = math.sin(B)
    char_output = []
    zbuffer = []

    xbuffer = (x - screen_width) // 2
    ybuffer = (y - screen_height) // 2

    for i in range(screen_height + 1):
        char_output.append([' '] * (screen_width + 0))
        zbuffer.append([0] * (screen_width + 0))
    theta = 0
    while (theta < 2* math.pi):
        theta += theta_spacing
        costheta = math.cos(theta)
        sintheta = math.sin(theta)
        phi = 0
        while (phi < 2*math.pi):
            phi += phi_spacing
            cosphi = math.cos(phi)
            sinphi = math.sin(phi)
            circlex = R2 + R1*costheta
            circley = R1*sintheta
            x = circlex*(cosB*cosphi + sinA*sinB*sinphi) - circley*cosA*sinB
            y = circlex*(sinB*cosphi - sinA*cosB*sinphi) + circley*cosA*cosB
            z = K2 + cosA*circlex*sinphi + circley*sinA
            ooz = 1/z
            xp = int(screen_width/2 + K1*ooz*x)
            yp = int(screen_height/2 - K1*ooz*y)
            L = cosphi*costheta*sinB - cosA*costheta*sinphi - sinA*sintheta + cosB*(cosA*sintheta - costheta*sinA*sinphi)
            if L > 0:
                if ooz > zbuffer[xp][yp]:
                    zbuffer[xp][yp] = ooz
                    luminance_index = L*8
                    color_chars = [
                        '\033[38;5;219m.',
                        '\033[38;5;183m,',
                        '\033[38;5;147m-',
                        '\033[38;5;111m~',
                        '\033[38;5;75m:',
                        '\033[38;5;39m;',
                        '\033[38;5;38m=',
                        '\033[38;5;37m!',
                        '\033[38;5;36m*',
                        '\033[38;5;35m#',
                        '\033[38;5;34m$',
                        '\033[38;5;70m@',
                    ]
                    char_output[xp][yp] = color_chars[int(luminance_index)]

    print('\x1b[H')
    for row in range(ybuffer - 1):
        print()
    for i in range(screen_height):
        print(" " * (xbuffer - 1), end="")
        for j in range(screen_width):
            print(char_output[i][j], end='')
        print()
theta_spacing = 0.07
phi_spacing = 0.02
R1 = 1
R2 = 2
K2 = 6
screen_width = 35
screen_height = 35
K1 = screen_width*K2*3/(8*(R1+R2))
print('\x1b[2J')
A = 1.0
B = 1.0
while True:
    size = os.get_terminal_size()
    x = size.columns
    y = size.lines
    render_frame(A, B, x, y)
    A += 0.04
    B += 0.01

