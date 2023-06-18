import sympy as sp


def matrix_exp(A, t):
    A = sp.Matrix(A)
    return sp.simplify(sp.exp(A*t))
