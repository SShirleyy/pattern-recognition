% D is the directory of training example
%pD is DiscreteD
function hmm = TrainMelody(nStates,D)
pD=DiscreteD;
pD.PseudoCount=0.5;
winlength=0.02;
for r=1:10
melodyfile= sprintf(['%d.wav'], r);
[Y, FS]=audioread([D(1).folder,'\',melodyfile]);
frIsequence=GetMusicFeatures(Y,FS,winlength);

lData(r)=size(frIsequence,2);
obsDataR=FeatureExtract(frIsequence);
if r==1
obsData=obsDataR;
else
obsData=[obsData,obsDataR];
    end
  end
hmm=MakeLeftRightHMM(nStates,pD,obsData(1,:),lData);

end