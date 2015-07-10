import matplotlib.pyplot as plt
import numpy
import seaborn as sns
import math

sns.set_style('white')
PALETTE = sns.color_palette()

def exp_fun(param):
    return lambda x: math.exp(x / -float(param))

xs = numpy.arange(0, 14, 0.1)

xs_show = xs
plt.plot(xs, map(exp_fun(1), xs), '--', color='gray')
xs_show = filter(lambda x: x <= 1, xs_show)
plt.plot(xs_show, map(exp_fun(1), xs)[:len(xs_show)], linewidth=4, color=PALETTE[0])

plt.axvline(1, 0.4, 1, linestyle='--', color=PALETTE[0], linewidth=4)
xs_show = filter(lambda x: x >= 1, xs)
plt.plot(xs_show, map(exp_fun(2), xs)[:len(xs_show)], '--', color='gray')
xs_show = filter(lambda x: x <= 3, xs_show)
plt.plot(xs_show, map(exp_fun(2), xs)[:len(xs_show)], linewidth=4, color=PALETTE[0])

plt.axvline(3, 0.4, 1, linestyle='--', color=PALETTE[0], linewidth=4)
xs_show = filter(lambda x: x >= 3, xs)
plt.plot(xs_show, map(exp_fun(4), xs)[:len(xs_show)], '--', color='gray')
xs_show = filter(lambda x: x <= 7, xs_show)
plt.plot(xs_show, map(exp_fun(4), xs)[:len(xs_show)], linewidth=4, color=PALETTE[0])

plt.axvline(7, 0.4, 1, linestyle='--', color=PALETTE[0], linewidth=4)
xs_show = filter(lambda x: x >= 7, xs)
plt.plot(xs_show, map(exp_fun(8), xs)[:len(xs_show)], '--', color='gray')
xs_show = filter(lambda x: x <= 14, xs_show)
plt.plot(xs_show, map(exp_fun(8), xs)[:len(xs_show)], linewidth=4, color=PALETTE[0])

plt.gca().xaxis.set_major_locator(plt.NullLocator())
plt.gca().yaxis.set_major_locator(plt.NullLocator())
plt.xlabel('Time')
plt.ylabel('Memory Retention')
plt.savefig('forgettting_curves.svg')
