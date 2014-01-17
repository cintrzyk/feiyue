jQuery ->
  $('#print_contact').click (e) ->
    e.preventDefault()
    mywindow = window.open('', $('#print').html(), 'height=400,width=600')
    mywindow.document.write('<html><head><title>Contact</title></head><body>')
    mywindow.document.write($('#print').html())
    mywindow.document.write('</body></html>')
    mywindow.print()
    mywindow.close()
