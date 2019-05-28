#NoteID

Finds the dominant frequency in a .wav and matches to a
musical note.

Place the desired .wav file in the same directory as the NoteID.m file.

The current version is set up for a mono file. 
For a stereo file, uncomment Line 19 (yR = y(1:length(y)-1,2)';). 
Line 21 (yFFT = abs(fft(yL,Fs*2));) can be copied or modified to accommodate the right channel.

The plotter at the end of the file plots up to 20 kHz and can be modified as needed.
