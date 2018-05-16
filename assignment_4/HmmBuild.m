%train hmm system for song recognition, save into workspace

clear all

nstates = 10;
R=randperm(15);%randomlize the rank of melody,choose first 12 items for training and the left 3 for validation

hmms(1) = TrainHMM(nstates,'later',R);
hmms(2) = TrainHMM(nstates+3,'TwoTiger',R);
hmms(3) = TrainHMM(nstates,'slow',R);
hmms(4) = TrainHMM(nstates,'TwinklStar',R);
hmms(5) = TrainHMM(nstates,'you',R); 
hmms(6) = TrainHMM(nstates+2,'mom',R); 

save HMM_system
save R
disp('HMM training has succeed!')

