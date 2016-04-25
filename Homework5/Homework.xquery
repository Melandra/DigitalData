declare namespace tei = "http://www.tei-c.org/ns/1.0";

for $play in collection("Shakespeare")
        let $playname := $play//tei:fileDesc/tei:titleStmt/tei:title/text()
        let $speaker := distinct-values($play//tei:body//tei:speaker/text())
        return <play> 
                    <title> {$playname} </title>
                    <speaker> {$speaker} </speaker>
                </play>