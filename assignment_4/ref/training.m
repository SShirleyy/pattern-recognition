clc
clear
cd C:\Users\SHE\Desktop\PattRecClasses\humming

% for i=1:10
%     hmms(i)=HMM();
% end

songname=char(string({
    'later',
    'mom',
    'mouse',
    'night',
    'rose'
    'slow'
    'Twinklstar'
    'TwoTiger'
    'you'}));
D1= dir([songname(1,:), '\*.wav']); 
D2= dir([songname(2,:), '\*.wav']); 
D3= dir([songname(3,:), '\*.wav']); 
D4= dir([songname(4,:), '\*.wav']); 
D5= dir([songname(5,:), '\*.wav']);
D6= dir([songname(6,:), '\*.wav']);
D7= dir([songname(7,:), '\*.wav']);
D8= dir([songname(8,:), '\*.wav']);
D9= dir([songname(9,:), '\*.wav']);


hmms(1)=TrainMelody(8,D1);
hmms(2)=TrainMelody(8,D2);
hmms(3)=TrainMelody(8,D3);
hmms(4)=TrainMelody(4,D4);
hmms(5)=TrainMelody(12,D5);
hmms(6)=TrainMelody(8,D6); 
hmms(7)=TrainMelody(8,D7); 
hmms(8)=TrainMelody(8,D8); 
hmms(9)=TrainMelody(8,D9); 
