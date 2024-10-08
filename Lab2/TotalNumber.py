# -*- coding: utf-8 -*-
"""
Created on Wed Feb 21 22:27:20 2024

@author: BilgeKaan
"""

from gtts import gTTS
TotalNumber = "2. 2. 1. 0. 2. 7. 5. 8."
Total_audio = gTTS ( text = TotalNumber , lang ="en", slow = True )
Total_audio . save ("TotalNumber2.flac")
#for num in range (0 , 10 ):
 #   strnum = ", " + str ( num ) + "."
   # num_audio = gTTS ( text =strnum , lang ="en", slow = True )
   # num_audio . save ( str ( num )+".flac ")
