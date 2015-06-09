function bmech_renamechannel(och,nch,fld)
      
% This m-file will rename channels in your data
%
% bmech_renamechannel(och,nch,fld)
% 
% ARGUMENTS
%  och        ...    name of old channels as cell array of strings ex. {'ch1','ch2','ch3'}
%  nch        ...    name of new channels as cell array of strings ex. {'RKNA','RANK','fz'}
%  fld        ...    optional argument. name of folder to operate on


% Revision History
%
% Created by Philippe C. Dixon May 2009 
% - based on original function by JJ Loh
%
% Updated by Philippe C. Dixon March 2011
% - Added optional 3rd argument
%
% Updated by Philippe C. Dixon January 2014
% - updates channel list in relevant section (video or analog)
% - uses standalone renamechannel


% Part of the Zoosystem Biomechanics Toolbox 
%
% Main contributors:
% Philippe C. Dixon, Dept of Engineering Science. University of Oxford. Oxford, UK.
% Yannick Michaud-Paquette, Dept of Kinesiology. McGill University. Montreal, Canada.
% JJ Loh, Medicus Corda. Montreal, Canada.
% 
% Contact: 
% philippe.dixon@gmail.com
%
% Web: 
% https://github.com/PhilD001/the-zoosystem
%
% Referencing:
% please reference the paper below if the zoosystem was used in the preparation of a manuscript:
% Dixon PC, Loh JJ, Michaud-Paquette Y, Pearsall DJ. The Zoosystem: An Open-Source Movement Analysis 
% Matlab Toolbox.  Proceedings of the 23rd meeting of the European Society of Movement Analysis in 
% Adults and Children. Rome, Italy.Sept 29-Oct 4th 2014. 



if nargin ==2
    fld = uigetfolder;
else
    fl = engine('path',fld,'extension','zoo');
end

cd(fld);

% check for single string instead of cell array of strings
%
if ~iscell(och)
    och = {och};
end

if ~iscell(nch)
    nch= {nch};
end


if length(och)~=length(nch)
    disp('number of new name channels does not match number of old channel names to replace')
    return    
end
    
disp(' ')
disp('renaming the following channels:')
for i = 1:length(och)
    disp(['renaming ', och{i}, ' to ',nch{i}])
end

disp(' ')


for i = 1:length(fl)
    data = zload(fl{i});
    batchdisplay(fl{i},'renaming channels')
    data = renamech(data,och,nch);
    save(fl{i},'data');
end













