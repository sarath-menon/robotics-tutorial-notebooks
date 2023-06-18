
import pygame
import math

#COLORS
white = (255,255,255)
black = (0,0,0)
gray = (150, 150, 150)
Dark_red = (150, 0, 0)

class PendulumOnCart(object):
 
    def __init__(self, cart_pos=[0.,10.], pendulum_pos=[0.,0.]):  # Set ball coordenates and radius
        self.x = 0
        self.y = 0

        self.pendulum_pos = pendulum_pos
        self.cart_pos = cart_pos

        self.radius = 5
 
    def draw(self, bg):  # Draw circle and line based on XY coordinates
        width = 800
        pygame.draw.lines(bg, black, False, [self.cart_pos, self.pendulum_pos], 2)

        #draw base joint
        cart = pygame.Rect(0, 0, 40, 20)
        cart.center = self.cart_pos
        pygame.draw.rect(bg, Dark_red, cart)

        # draw rotational joint
        pygame.draw.circle(bg, black, self.cart_pos, 5)

        # pendulum ball
        pygame.draw.circle(bg, black, self.pendulum_pos, self.radius)
        pygame.draw.circle(bg, Dark_red, self.pendulum_pos, self.radius - 2)
