function name = labelToName(label)

    switch(label)
    case 2
        name = 'Erable';
    case 6
        name = 'Ortie';
    case 13
        name = 'Corylus';
    case 36
        name = 'Geranium';
    otherwise
        name = 'Inconnu';
    end
end 