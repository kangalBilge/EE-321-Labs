% notename = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'];
% song = ['A', 'A', 'E', 'E', 'F#', 'F#', 'E', 'E', 'D', 'D', 'C#', 'C#', 'B', 'B', 'A', 'A'];
% for k1 = 1:length(song)
% idx = strcmp(song(k1), notename);
% end
% songidx = find(idx);
% dur = 0.3*8192;
% songnote = [ ];
% for k1 = 1:length(songidx)
% songnote = [songnote; [notecreate(songidx(k1),dur) zeros(1,75)]];
% end
% soundsc(songnote, 8192)
notename = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};
song = {'A', 'A', 'E', 'E', 'F#', 'F#', 'E', 'E', 'D', 'D', 'C#', 'C#', 'B', 'B', 'A', 'A'};

for k1 = 1:length(song)
    idx = strcmp(song{k1}, notename);
    songidx(k1) = find(idx);
end

dur = round(0.3*8192);  % Round to the nearest integer
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [Part6(songidx(k1), dur), zeros(1,75)]];
end

soundsc(songnote, 8192);






% Array of note names
notename = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};

% Specify the song notes and their durations
song = {'E', 'E', 'E', 'E', 'E', 'E', 'E', 'G', 'C', 'D', 'E', 'F', 'F', 'F', 'F', 'F', 'E', 'E', 'E', 'E', 'D', 'D', 'E', 'D', 'G', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'G', 'C', 'D', 'E', 'F', 'F', 'F', 'F', 'F', 'E', 'E', 'E', 'E', 'D', 'D', 'E', 'D'};

% Convert note names to indices
for k1 = 1:length(song)
    idx = strcmp(song{k1}, notename);
    songidx(k1) = find(idx);
end

% Set the duration for each note
dur = round(0.3*8192);

% Generate the waveform for each note and concatenate
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1), dur) zeros(1, 75)]'];
end

% Play the composed song
soundsc(songnote, 8192);