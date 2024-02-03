function addTextbox(id, label) {
    var componentHtml = '<div class="' + 'textboxes-group' +'">' +
                            '<label for="' + id + '">' + label + '</label>' +
                            '<input type="text" id="' + id + '" name="' + id + '">' +
                        '</div>';
    $('.textboxes').append(componentHtml);
}

function createTableResults(){
    var table = $('<table>').addClass('table');

    var tr = $('<tr>').appendTo(table);
    tr.append('<th>Description</th>');
    tr.append('<th>Type</th>');
    tr.append('<th>Topics</th>');

    $.ajax({
        type: 'GET',
        url: 'https://api.sampleapis.com/codingresources/codingResources',
        contentType: 'application/json',
        success: function (response) {
           for(var i = 0; i < response.length; i++){
            var data = $('<tr>').appendTo(table);
            data.append('<td>' + response[i].description + '</td>');
            data.append('<td>' + response[i].types.join() + '</td>');
            data.append('<td>' + response[i].topics.join() + '</td>');
           }
           table.appendTo('.tableResults');
        },
        error: function (error) {
            console.error('Request Error:', error);
        }
    });
}

$(document).ready(function () {
    addTextbox("textbox1", "First Name");
    addTextbox("textbox2", "Last Name");
    addTextbox("textbox3", "City");
    addTextbox("textbox4", "State");
    addTextbox("textbox5", "Zip");
    addTextbox("textbox6", "Company");
    createTableResults();
});