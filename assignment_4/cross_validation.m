%cross validation

clear all
load HMM_system 
load R

pro = [];
winlength = 0.02;
SongBase = {
    'later',
    'TwoTiger',
    'slow',
    'TwinklStar',
    'you',
    'mom'
    };
misclass = 0;

for val = 1 : 6
 disp('test for song:');
 disp(SongBase(val,:));
 for i = 13 : 15
   melodyfile = sprintf(['%d.wav'],R(i));
   if val == 1
   D = 'later';
   end
   if val == 2;
   D = 'TwoTiger';
   end
   if val == 3;
   D = 'slow';
   end
   if val == 4;
   D = 'TwinklStar';
   end
   if val == 5;
   D = 'you';
   end
   if val == 6;
   D = 'mom';
   end

       
   [Y, FS] = audioread([D,melodyfile]);
   frIsequence = GetMusicFeatures(Y,FS,winlength);
   [xtest,] = FeatureExtract(frIsequence);
   lp = logprob(hmms,xtest);
   
   index = find(lp == max(lp));
   if index == val
       fprintf(['%d is rightly classified'], i);
   else    
       misclass = misclass + 1; 
       fprintf(['%d is wrongly classified'], i);     
   end
   pro = [pro;lp];
   fprintf('\n');
 end
end

 mis_rate = single(100 * misclass / size(pro,1));
 fprintf(['misclassification rate is %d'], mis_rate);





