
      // onload callback
      function drawChart() {
        var public_key = 'VG1OxdW5lYuW70WazZMl';

        // JSONP request
        var jsonData = $.ajax({
          url: 'https://data.sparkfun.com/output/' + public_key + '.json',
          data: {page: 1},
          dataType: 'jsonp',
        }).done(function (results) {
          var data = new google.visualization.DataTable();
          data.addColumn('datetime', 'Time');
          data.addColumn('number', 'Temp');
          data.addColumn('number', 'Humidity');
          data.addColumn('number', 'Light');
          $.each(results, function (i, row) {
            data.addRow([
              (new Date(row.timestamp)),
              parseFloat(row.temp),
              parseFloat(row.humidity),
              parseFloat(row.lum)
            ]);
          });

          var chart = new google.visualization.LineChart($('#chart').get(0));
          chart.draw(data, {
            title: 'theHub Fairbanks'
          });
        });
      }
      // load chart lib
      google.load('visualization', '1', {
        packages: ['corechart']
      });

      // call drawChart once google charts is loaded
      google.setOnLoadCallback(drawChart);