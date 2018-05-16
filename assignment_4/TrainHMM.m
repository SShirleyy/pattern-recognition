
% D is the directory of training example
%pD is DiscreteD
function hmm = TrainHMM(nStates,D,R)
% pD = DiscreteD;
% pD.PseudoCount=0.5;%The DiscreteD class has facilities for using pseudocounts in HMM training.(recommanded using it)
obsData = [];

for r = 1 : 12
melodyfile = sprintf(['%d.wav'], R(r));
[Y, FS] = audioread([D,melodyfile]);
frIsequence = GetMusicFeatures(Y,FS);

[obs,] = FeatureExtract(frIsequence);

obsData = [obsData,obs];

lData(r) = size(obs,2);
end
  pD = MakeGMM(3,obsData);
  hmm = MakeLeftRightHMM(nStates,pD,obsData,lData); 
end