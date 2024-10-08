function [note] = notecreate(frq_no, dur)
    note = sin(2*pi*[1:dur]/8192*(440*2.^((frq_no-3)/12)));
end