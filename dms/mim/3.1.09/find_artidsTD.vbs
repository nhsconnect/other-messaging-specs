
dim fso
dim n

set fso = CreateObject("Scripting.FileSystemObject")

dim fol

set fol = fso.GetFolder(".")

n = 0


set artids = CreateObject("Scripting.Dictionary")
FindArtIds fol

set fout = fso.CreateTextFile(".\artidsTD.txt", true)

artlist = artids.Keys

BubbleSort artlist

for each artid in artlist
	fout.WriteLine artid & "," & artids.Item(artid)
next

fout.close

msgbox "done, found " & artids.Count & " artefact IDs"

Sub FindArtIds(fol)

	Set r = new RegExp
	r.IgnoreCase = false
	r.Global = true
	r.Pattern = "[A-Z]{4}_[A-Z]{2}\d{6}[A-Z]{2}\d{2}"

	For Each f in fol.Files
		' check filename to see if it contains an artid
		
		set ms = r.Execute(f.Name)
		
		for each m in ms
			artids.Item(m.Value) = artids.Item(m.Value) + 0 ' this lets us see the ones that are not referenced in HTML files.
		next
		
		' if it's an htm file, check the content
		
		'TD Changed to just look at index.htm
		if lcase(right(f.name, 4)) = "IM.htm" then
			set fs = f.OpenAsTextStream()
			
			on error resume next
			oot = fs.ReadAll
			
			if err.number <> 0 then msgbox f.Path
						
			set ms = r.Execute(oot)
			
			if ms.Count = 0 then stop
			
			for each m in ms
			
				artids.Item(m.Value) = artids.Item(m.Value) + 1
			
			next
			
			
		end if
	next 

	for each subfol in fol.SubFolders
		if left(subfol.name, 1) <> "." then
			FindArtIds subfol
		end if
	next

End Sub



'Sub BubbleSort(arr As Variant, Optional numEls As Variant, _
'    Optional descending As Boolean)

Sub BubbleSort(arr)
    Dim value 'As Variant
    Dim index 'As Long
    Dim firstItem 'As Long
    Dim indexLimit 'As Long, lastSwap As Long
	Dim lastSwap

    ' account for optional arguments
    numEls = UBound(arr)
    firstItem = LBound(arr)
    lastSwap = numEls

    Do
        indexLimit = lastSwap - 1
        lastSwap = 0
        For index = firstItem To indexLimit
            value = arr(index)
            If (value > arr(index + 1)) Xor descending Then
                ' if the items are not in order, swap them
                arr(index) = arr(index + 1)
                arr(index + 1) = value
                lastSwap = index
            End If
        Next
    Loop While lastSwap
End Sub