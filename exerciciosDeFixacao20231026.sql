Create trigger mensagem (
    After Insert On CLiente,
    AS,
    Insert Into Auditoria (mensagem) Values (Concat('Basquete é vida!', Now())),
    End;
);

Create trigger exclusao (
    Before Delete On Clientes,
    AS,
    Insert Into Auditoria (mensagem) Values (Concat('Basquete é vida!', Now())),
    End;
);

Create trigger atualizacao (
    After Insert On Pedidos,
    AS,
    IF novo NOT NULL = ''
        Update Clientes Set nome = novo;
        Insert Into Auditoria (mensagem) Values (Concat('Nome de', velho, 'para', novo, Now()));
    Else
        Insert Into Auditoria (mensagem) Values ('Nome vazio ou NULL para ' Now());
    End IF;
End;
)

Create trigger produto (
    After Insert On Pedidos,
    AS,
        Update Produtos Set estoque = estoque - New.qtd Where id = New.id_pdt;
        IF Select estoque From Produtos Where id = New.id_pdt < 5:
            Insert Into Auditoria (mensagem) Values (Concat('Estoque baixo com id ', New.id_pdt, Now()));
        End IF;
End;
)
