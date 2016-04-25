declare namespace tei = "http://www.tei-c.org/ns/1.0";

for $play in collection("Shakespeare")
        let $playname := $play//tei:fileDesc/tei:titleStmt/tei:title/text()
        let $speakers := distinct-values($play//tei:body//tei:speaker)
        return <play> 
                    <title> {$playname} </title>
                    {for $speaker in $speakers
                    order by $speaker
                   return <speaker> {$speaker} </speaker>
                    }
                </play>