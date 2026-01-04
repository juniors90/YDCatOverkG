InstallGlobalFunction( ActionkGdualOnYDModule, function( delta_h, simple, base_elm )
    local BaseMod, pos_wi, x, g, conj;
    BaseMod := simple!.Base;
    pos_wi := Position(BaseMod, base_elm);
    x := base_elm!.GrpElement;
    g := simple!.Weight.g;
    conj := x * g * x ^ (-1);
    if delta_h(conj) <> 0 then
       return base_elm;
    else
        return 0;
    fi;
end);


InstallGlobalFunction(StructureMatrixSimpleModule, function( delta_h, simple )
    local BaseMod, degreeMod, M, action, j;
    BaseMod := simple!.Base;
    degreeMod := Length( BaseMod );
    M := NullMat( degreeMod, degreeMod, Rationals );
    for j in [1..Length(BaseMod)] do
        action := ActionkGdualOnYDModule( delta_h, simple, BaseMod[j]);
        if action <> 0 then
            M[Position( BaseMod, action )][j] := 1;
        fi;
    od;
    return M;
end);
