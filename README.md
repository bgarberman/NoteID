# NoteID

Finds the dominant frequency in a .wav and matches to a
musical note.

## Usage

Place the desired .wav file in the same directory as the NoteID.m file.

The current version is set up for a mono file. 
For a stereo file, uncomment the following line.

```matlab
(yR = y(1:length(y)-1,2)';). 
```




