%?Anesthetic Action on the Transmission Delay Between Cortex and Thalamus 
%Explains the Beta-buzz Observed under Propofol Anesthesia?

%PLOS ONE  2016                                                  
%Authors: Meysam Hashemi, Axel Hutt, Darren Hight, and Jamie Sleigh
% ------------------------------------------------------
% Spectrogram plot of  EEG data during propofol-induced anesthesia.
% The code produces the spectrogram of frontal EEG power observed in eight subjects 
%during propofol-induced anesthesia(shown in Appendix S4). 

%------------------------------------------------------
% Copyright (C) 2016 MEYSAM HAHSEMI.
% ------------------------------------------------------


clc
clear all

DATA=dir('*.mat');
Subject={DATA.name}';

N=4; % number of  windows in the plotted figure

for ii = 1:numel(Subject)
    
load(Subject{ii})
        
Fs=256;

[Sn,Fn,Tn,Pn] = spectrogram(x,4*Fs,3*Fs,4*Fs,Fs);

Pnn=10*log10(Pn);

jj=ceil(ii/N);

figure(jj)

subplot(N/2,N/2,ii-N*(jj-1))

pcolor(Tn,Fn(1:401),Pnn(1:401,:));
shading interp;
caxis([-5,20]);


title(['Spectrogram Subject number' num2str(ii)],'fontsize',12);

ylabel(' Frequency (Hz)','interpreter','tex','fontsize',14)
xlabel(' Time (sec)  ','interpreter','tex','fontsize',14)


axis([0,400, 0,50]);

set(gca, 'fontsize',14);

set(gca,'XTick',[0,200,400]);
set(gca,'XTickLabel',{0,200,400},'FontSize',14);

set(gca,'YTick',[0,10,20,30,40]);
set(gca,'YTickLabel',{0,10,20,30,40},'FontSize',14);


end