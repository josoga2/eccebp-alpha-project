#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import pandas as pd


# In[3]:


data = pd.read_csv('probes_mut_met.csv', sep=';')


# In[4]:


data.head()


# In[5]:


data['start'] = data['position']-50
data['end'] = data['position']+50


# In[6]:


data['chr'] = data['chrome']
data['strand'] = '+'
data = data[['chr','start','end','gene','strand']]

data['chr'] = 'chr' + data.chr.map(str)


# In[7]:


data.head()


# In[8]:


data.to_csv('probes_mut_met_bed.bed', sep = '\t', header=None, index=False)


# In[ ]:




