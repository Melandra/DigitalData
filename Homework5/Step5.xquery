declare namespace tei = 'http://www.tei-c.org/ns/1.0';
let $correct_name := 'Theseus'
let $variants := ('Theseus.', 'The.')
for $speaker in doc('Shakespeare/5714.xml')//tei:speaker
return
    if (index-of($variants, $speaker)) then
        update value $speaker with $correct_name 
    else
        ''