Apr. 2020

1) Dowload_SuperCollider(LatestVersion-X32, X64) 
From Here	: https://supercollider.github.io/download

2) While Opening for the first time, allow privileges. (Pop-up Window)

3) Wait for the Help Window to show up (Upper Right).

4) Press Ctrl+B (You will see Server-Values go Green [Right-Bottom-Of-The-S.C.Window])

5) Find the file directories in the code [Line(877, 889, & 901)]
Carefully erase from "--> to the next one on every line. (Including ")++Then Replace with the audio files (Drag&Drop from the Rødgrød_med_Fløde folder)
Careful!!! To Replace them with the correct order!
exp({rød grød med fløde.wav} File goes to line 877)
**MORE ON THE SETUP PHOTO

exp.
~buffer = Buffer.read(s,"C:/Users/Flud666/Documents/Jason SK/.scd/GUI/Rødgrød_med_Fløde/rød grød med fløde.wav");

it is going to be
erasing
a) ~buffer = Buffer.read(s,    );

replacing
b)~buffer = Buffer.read(s,"~/Rødgrød_med_Fløde/rød grød med fløde.wav");

6)Click anywhere in the code and 
Run with --> Ctrl+Enter (Windows), Cmd + Return (MacOs)

7) Do not forget to Ctrl+S (for save) so you do not have to replace the files again next time!
*DontForgetToTurnOnTheEngines(ON-OFF,Main&&Drums(Right))
**&&SoundsByClickingOnTheFlag&Title!
ENJOY!!!

Jason S.K.
