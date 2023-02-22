EENG341 Signals and Systems Term Project

Made by Mikhail Smirnov and Yousef Ahmed
Group 6
--------------------------------------------------------------------------------------------------------------------------------------------------------------
This program is designed to generate and play the intro to the song, "Smoke On The Water" by Deep Purple and to later plot the time and frequency domain 
components, as well as the spectrogram. 
Figure 1 shows each note color-coded and the rhythm in which its played according to all of the samples.
Figure 2 shows the song plotted in the time domain, where if zoomed in, you are able to see the individual waveforms.
Figure 3 shows the magnitude of the signal after taking the Fourier Transform of the signal, otherwise known as a magnitude plot in the frequency domain.
Figure 4 shows the spectrogram of the generated song in Power/Frequency with respect to both frequency and time of the signal.

To run the program, it requires the script named "TermProject_Smoke_On_The_Water.m" and an additional function "draw_note.m".
TermProject_Smoke_On_The_Water.m runs the entire program, while draw_note.m is a supplementary function required to correctly plot the Figure 1.

Once those two files are downloaded, import them into your MATLAB path. For example, if your MATLAB files are located under "...\Documents\MATLAB"
then open up that path and move the two files into that directory. Once this is done, open MATLAB and open up both of the files in MATLAB.
MATLAB may ask you to add both files to your PATH which you will have to accept. Next, navigate to TermProject_Smoke_On_The_Water.m and click Run.

If you have your volume up, then the generated song will play automatically in MATLAB. The song will also be exported as .wav file by the
name of "SmokeOnTheWater.wav" in your MATLAB directory, which you are always able to access and listen to. 

While the song is playing, you may need to wait a few seconds for the plots to finish generating. Once that is done, the mentioned 4 figures are 
generated. 

The program runs completely on its own, meaning that it does not require any input from the user. 