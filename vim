
:%s/<\/*tr.\{-}>//gi
:%s/<\/*td.\{-}>//gi
:%s/<\/*table.\{-}>//gi

:%s/ href=/ 'src' => /g
:%s/ title=/ 'title' => /g
:%s/ target=['|"].\{-}['|"]//g

