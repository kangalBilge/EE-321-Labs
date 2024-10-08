notename = {'G1','G1#','A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#','A2','A2#','B2','C2'};
song = ["C","C","D","D","D","D","C","C","F","F","G","G","A2","A2","A2","A2","G","G","C2","C2","B2","B2","A2","A2","G","G","F","F","G","G","F","E","D","D","D","E","C", "C","C","C","C", "C","C","C","A2","B2","B2","A2","A2","G","G","F","G","G","F","E","D","D","D","E","C","C","C","D","D","D","D","D","D"];

for k1 = 1:length(song)
idx = strcmp(song{k1}, notename);
songidx(k1) = find(idx);
end
dur = 0.3*8192;
songnote = [ ];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1),dur) zeros(1,75)]'];
end
soundsc(songnote, 8192)
audiowrite('denizustukopurur.wav', songnote, 8192)