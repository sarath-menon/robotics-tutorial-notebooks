import pygame
import math

from objects import PendulumOnCart
 
#COLORS
white = (255,255,255)
black = (0,0,0)
gray = (150, 150, 150)
Dark_red = (150, 0, 0)

class Visualizer:
    def __init__(self, width, height, max_fps=30):
        self.width = width
        self.height = height

        # initialize pygame
        pygame.init()
        self.background = pygame.display.set_mode((width, height))
        clock = pygame.time.Clock()

        # set max fps
        clock.tick(max_fps) 

        # create ball object with some random coordinates
        self.length = 200

        # create the pendulum object
        self.sys = PendulumOnCart() 
 
    # Draw a grid behind the self.pendulum
    def grid(self): 

        for x in range(50, self.width, 50):
            pygame.draw.lines(self.background, gray, False, [(x, 0), (x, self.height)])
            for y in range(50, self.height, 50):
                pygame.draw.lines(self.background, gray, False, [(0, y), (self.width, y)])

    
    # calculate and set (x, y) position from the angle
    def set_angle(self, angle):
        # add 180 degrees to start from inverted position
        angle += math.pi

        self.sys.pendulum_pos[0] = round(self.sys.cart_pos[0] + self.length * math.sin(angle))
        self.sys.pendulum_pos[1] = round(self.sys.cart_pos[1] + self.length * math.cos(angle))
    
    # set cart position
    def set_cart_position(self, cart_pos):
        self.sys.cart_pos[0] = round(cart_pos[0])
        self.sys.cart_pos[1] = round(cart_pos[1])

    # Clean up the screen and start a new grid and new frame of self.pendulum with new coordinates
    def redraw(self): 
        # clear up the screen
        self.background.fill(white)
        # draw the grid
        self.grid()
        self.sys.draw(self.background)
        pygame.display.update()


 