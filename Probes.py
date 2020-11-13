#!/usr/bin/env python
# coding: utf-8
# to split main daaset based on fdr and delta values

# In[1]:
pwd
# In[2]:
ls
# In[3]:
import pandas as pd
import numpy as np
# In[4]:
probes = pd.read_csv('probes.csv', sep = ';')
# In[5]:
probes.shape
# In[6]:
probes.head()
# ### Subset 1: Significant mutation and Significant Methylation
# ##### FDR =< 0.01 (significant mutation)
# ##### $\delta \beta$ value > 0.1 (hypermethylated)
 
# In[7]:
probes_mut_met = probes[probes.fdr<=0.05]
probes_mut_met = probes_mut_met[probes_mut_met['mean_cebpa - mean_no_cebpa']>0.1]

# In[8]:
probes_mut_met.shape

# In[9]:
probes_mut_met.to_csv('probes_mut_met.csv', sep = ';')

# ### Subset 2: Insignificant mutation and Significant Methylation
# In[10]:
probes_nonmut_met = probes[probes.fdr>0.05]
probes_nonmut_met = probes_nonmut_met[probes_nonmut_met['mean_cebpa - mean_no_cebpa']>0.1]

# In[11]:
probes_nonmut_met.to_csv('probes_nonmut_met.csv', sep=';')

# In[12]:
probes_nonmut_met.shape

# ### Subset 3: Insignificant mutation and Insignificant Methylation
# In[6]:
probes_nonmut_nonmet = probes[probes.fdr>0.05]
probes_nonmut_nonmet = probes_nonmut_nonmet.loc[probes_nonmut_nonmet['mean_cebpa - mean_no_cebpa'].abs() <=0.1]

# In[7]:
probes_nonmut_nonmet.shape

# In[8]:
probes_nonmut_nonmet.to_csv('probes_nonmut_nonmet.csv', sep=';')

# In[9]:
probes_nonmut_nonmet.head()

# ### Subset 4: Significant mutation and Insignificant Methylation
# In[17]:
probes_mut_nonmet = probes[probes.fdr<=0.05]
probes_mut_nonmet = probes_mut_nonmet[probes_mut_nonmet['mean_cebpa - mean_no_cebpa']<=0.1]

# In[18]:
probes_mut_nonmet.to_csv('probes_mut_nonmet.csv', sep=';')
# In[19]:
probes_mut_nonmet.head()
# In[20]:
probes_mut_nonmet.shape
# ### All set of non-significant mut and met
# In[21]:
probes_other = pd.concat([probes_nonmut_met, probes_nonmut_nonmet, probes_mut_nonmet], axis=0)
# In[22]:
probes_other.shape
# In[ ]:
# In[24]:
probes_other.to_csv('probes_other.csv', sep=';')
probes.shape
