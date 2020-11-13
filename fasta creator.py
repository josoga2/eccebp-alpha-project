#!/usr/bin/env python
# coding: utf-8
# creates fasta file from triplexator output 

# In[7]:
import pandas as pd
import numpy as np
# In[22]:

tts = pd.read_csv('probes_mut_met_bed.TTS', sep='\t')

# In[23]:

tts.head()

# In[25]:

TTS = tts[['# Duplex-ID','TTS']]

# In[26]:

TTS.head()

# In[54]:

#chrom = TTS['Unnamed: 2']
#gene = TTS['# Duplex-ID']
#pos = TTS['Unnamed: 3']

headline = TTS['# Duplex-ID']
fasta = TTS['TTS']

# In[55]:

#TTS["Name"]= TTS['greater'].str.cat(headline, sep =" ")

# In[61]:

headline = '>' + headline.map(str)

# In[62]:

TTS["Name"]= headline.str.cat(fasta, sep ="\n")

# In[78]:

fastaTTS = TTS.Name.str.strip('')

# In[79]:

fastaTTS 

# In[80]:

fastaTTS.to_csv('fastaTTS.fasta', header=False, index=None)
