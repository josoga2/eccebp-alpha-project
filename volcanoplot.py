# -*- coding: utf-8 -*-
"""volcanoplot

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1-p9RlXCsndOK868BriVTSa_HVcUhcHaP

# Installs
"""

!pip install bioinfokit

import bioinfokit
import pandas as pd
import numpy as np
import seaborn as sns

from bioinfokit import analys, visuz

bioinfokit.__version__

"""# Import"""

df = pd.read_csv('probes.csv',sep=';', index_col='Num')

df.head()

x = pd.to_numeric(df['mean_cebpa - mean_no_cebpa'])
y = pd.to_numeric(df['p_vals'])
a = pd.to_numeric(df['fdr'])
b = df['site_status']
z = pd.concat([x,y,a,b], axis=1)

z.columns = ['delta','p_vals','fdr','site']
z = z.dropna()
z['log'] = np.log10(z['p_vals'])*-1

def statuser(s):
    if (s['log'] > 2) and (s['delta'] > 0.1):
        return 'Hypermethylation'
    if (s['log'] > 2) and (s['delta'] < -0.1):
        return 'Hypomethylation'
    #if  (s['log'] < 2) and (s['delta'] < 0.1):
   #     return 'no change'
    #if  (s['log'] > 2) and (s['delta'] < 0.1):
   #     return 'no change'
    else:
      return 'no change'

z['status'] = z.apply(statuser, axis=1)

#visuz.gene_exp.volcano(df=z, lfc='delta', pv='fdr')
z.head(1)

# Commented out IPython magic to ensure Python compatibility.
import matplotlib.pyplot as plt
# %matplotlib inline

sns.color_palette("coolwarm", as_cmap=True)

sns.scatterplot(x='delta', y='log', data=z, hue='status', alpha=None, 
                palette='coolwarm', edgecolor=None)
plt.plot([-0.5, 0.5], [2, 2], linewidth=0.5, color='b')
plt.plot([0.1, 0.1], [-1, 30], linewidth=0.5, color='b')
plt.plot([-0.1, -0.1], [-1, 30], linewidth=0.5, color='b')
plt.legend(loc="upper center", bbox_to_anchor=(0.5, 1.15), ncol=3)
plt.xlabel('Methylation change')
plt.ylabel('-Log(p-Value)')

sns.color_palette("coolwarm", as_cmap=True)

z["alpha"] = np.where(z.site == "peak_site", 0.2, 0.3)

ax = sns.scatterplot(x='delta', y='log', data=z[z.alpha == 0.3], alpha=0.3,
                     edgecolor = None, color='orange')
sns.scatterplot(x='delta', y='log', data=z[z.alpha == 0.2], 
                alpha=0.2, ax=ax, edgecolor = None, color='b')

plt.legend(('peak_site', 'no_peak_site'), ('cebpa', 'non cebpa'))
plt.legend(loc="upper center", bbox_to_anchor=(0.5, 1.15), ncol=3)
plt.plot([-0.5, 0.5], [2, 2], linewidth=0.5, color='r')
plt.plot([0.1, 0.1], [-1, 30], linewidth=0.5, color='r')
plt.plot([-0.1, -0.1], [-1, 30], linewidth=0.5, color='r')
plt.xlabel('Methylation change')
plt.ylabel('-Log(p-Value)')

