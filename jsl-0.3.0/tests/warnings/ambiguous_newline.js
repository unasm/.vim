/*jsl:option explicit*/
function ambiguous_newline() {
    /* the EOL test is based on JSLint's documentation */
    var a, b, i, o, s;

    /* legal: , */
    s = s.substr(0,
        1);

    /* legal: . */
    s = s.
        substr(0, 1);

    /* legal: ; */
    s = s.substr(0, 1);

    /* legal: : */
    o = { test :
        'works' };

    /* legal: { */
    /* legal: } */
    if (s) {
        s = i;
    }

    /* legal: ( */
    s = s.substr(
        0, 1);

    /* legal: [ */
    s = o[
        'test'];

    /* legal: = */
    s =
        '?';

    /* legal: < */
    b = (i <
        14);

    /* legal: > */
    b = (i >
        93);

    /* legal: ? */
    i = (b ?
        1 : 0);

    /* legal: ! */
    b = (!
        false);

    /* legal: + */
    i = 55 +
        i;

    /* legal: - */
    i = 101 -
        i;

    /* legal: * */
    i = i *
        2;

    /* legal: / */
    i = i /
        43;

    /* legal: % */
    i = i %
        16;

    /* legal: ~ */
    i = ~
        16;

    /* legal: ^ */
    i = i ^
        32;

    /* legal: | */
    i = i |
        64;

    /* legal: & */
    i = i &
        2;

    /* legal: == */
    b = (i ==
        99);

    /* legal: != */
    b = (i !=
        -1);

    /* legal: <= */
    b = (i <=
        4);

    /* legal: >= */
    b = (i >=
        3.14);

    /* legal: += */
    i +=
        1;

    /* legal: -= */
    i -=
        1;

    /* legal: *= */
    i *=
        19;

    /* legal: /= */
    i /=
        17;

    /* legal: %= */
    i %=
        15;

    /* legal: ^= */
    i ^=
        1024;

    /* legal: |= */
    i ^=
        512;

    /* legal: &= */
    i ^=
        256;

    /* legal: << */
    i = i <<
        2;

    /* legal: >> */
    i = i >>
        1;

    /* legal: || */
    b = (b ||
        false);

    /* legal: && */
    b = (b &&
        true);

    /* legal: === */
    b = (i ===
        0);

    /* legal: !== */
    b = (i !==
        0);

    /* legal: <<= */
    i <<=
        1;

    /* legal: >>= */
    i >>=
        2;

    /* legal: >>> */
    i = i >>>
        4;

    /* legal: >>>= */
    i >>>=
        2;

    /* legal */
    o =
    {
        'component one': 1,
        'component two': 2
    };

    /* legal */
    o = {
        'one': 1,
        'two': 2
    };

    /* legal */
    i = o['one'
        ];

    /* illegal */
    i = o
        ['one']; /*warning:ambiguous_newline*/

    /* illegal: identifier */
    s = i
        + "?"; /*warning:ambiguous_newline*/

    /* illegal: string */
    s = "this "
        + i; /*warning:ambiguous_newline*/

    /* illegal: number */
    i = 14
        / 2; /*warning:ambiguous_newline*/

    /* illegal: ) */
    b = (i == 7)
        || false; /*warning:ambiguous_newline*/

    /* illegal: ) */
    s = o['test']
        + "!"; /*warning:ambiguous_newline*/

    /* illegal: ++ */
    b = i++
        || true; /*warning:ambiguous_newline*//*warning:inc_dec_within_stmt*/

    /* illegal: -- */
    s = i--
        + " = i"; /*warning:ambiguous_newline*//*warning:inc_dec_within_stmt*/

    /* legal */
    if (true)
    {
        i++;
    }
    else
    {
        i--;
    }
    while (false)
    {
        i--;
    }
    switch (1)
    {
    default:
        break;
    }
    for (i = 0; i < 1; i++)
    {
        s = i + "";
    }
    function Test()
    {
        return "";
    }
    try
    {
        s = null;
    }
    catch (err)
    {
    }
}
