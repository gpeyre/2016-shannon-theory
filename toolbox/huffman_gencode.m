function [C,L] = huffman_gencode(T)

% huffman_gencode - T is a hufftree
%
%   [C,L] = huffman_gencode(T)
%
%   L{i} is a code word, L{i}=length(C{i}).
%
%   Copyright (c) 2016 Gabriel Peyre

if not(iscell(T)) % || not(length(T)==2)
    C = {};
    C{T} = -1;
elseif length(T)==1
    C = huffman_gencode(T{1});
    % remove traling -1
    for i=1:length(C)
        C{i} = C{i}(1:end-1);
    end
elseif length(T)==2
    C1 = huffman_gencode(T{1});
    C2 = huffman_gencode(T{2});
    C = {};
    for i=1:length(C1)
        if not(isempty(C1{i}))
            C{i} = [0 C1{i}];
        end    
    end
    for i=1:length(C2)
        if not(isempty(C2{i}))
            C{i} = [1 C2{i}];
        end
    end
else
    error('Problem');
end

L = [];
for i=1:length(C)
    L(i)=length(C{i});
end
L = L(:);

end