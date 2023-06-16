import sympy as sp
import sympy.physics.mechanics as spm
from sympy.physics.mechanics import dynamicsymbols

# sp.init_printing()
sp.init_printing(use_unicode=True)
# spm.init_vprinting()

# Constants
m, k1, k2, L = sp.symbols('m k1 k2 L', real=True, positive=True)

# Variables
x = spm.dynamicsymbols('x')
xd = spm.dynamicsymbols('x', 1)
t = sp.Symbol('t')

# Potential energy
V = 0.5 * k1 * x**2

# Kinetic energy
T = 0.5 * m * xd**2

# Compute lagrangian
L = T - V

expr = sp.diff(sp.diff(L, xd), t) - sp.diff(L, x)
expr = expr.simplify()

# get output in latex
sp.pprint(expr.simplify())

# # get output in latex
# print(sp.latex(expr.simplify()))
