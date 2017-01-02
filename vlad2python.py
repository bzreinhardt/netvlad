#!/usr/local/python
import argparse
import numpy as np
import sys
import array

def open_netvlad_descriptors(file, descriptor_size=4096):
  with open(file, 'rb') as f:
    raw = f.read()
  raw_array = array.array("f", raw)
  if sys.byteorder != "big":
    raw_array.byteswap()
  buff = np.array(raw_array)
  # Assume numbers are divisable by descriptor_size
  return buff.reshape((descriptor_size, buff.size/num_descriptors))
	

