InstallGlobalFunction( DeltaFunctionForElementOfG, function(elem1, field)
    local elem2;
    return function(elem2)
        if elem1 = elem2 then
            return One(field);
        else
            return Zero(field);
        fi;
    end;
end);