$(document).ready(function(){

    $('#tableau_bord').click(function(){
        $.ajax({
            url : path+'/caissier/getChartChiffreAffaireEtStock',
            type :'GET' ,
            success : function(response){
                // DEBUT CHIFFRE D'AFFAIRE DU SAC
                    console.log('response.banane[0]');
                    console.log(response.banane[0]);
                    let labels1 = ['Banane', 'Cartable', 'Pochette', 'Coffret'];
                    let data1 = [response.banane[0], response.cartable[0] , response.pochette[0], response.coffret[0]];
                    let colors1 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];
                    
                    chart1.data.datasets.pop();
                    chart1.data.datasets.push({
                        data: data1,
                        backgroundColor: colors1
                    });
                    chart1.update();
                // FIN CHIFFRE D'AFFAIRE DU SAC
                // DEBUT CHIFFRE D'AFFAIRE DE VETEMENTS
                    let labels2 = ['Robe', 'Tunnique', 'Short', 'Patalon'];
                    let data2 = [ response.robe[0] , response.tunnique[0] , response.short[0] , response.patalon[0]];
                    let colors2 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];
                    chart2.data.datasets.pop();
                    chart2.data.datasets.push({
                        data: data2,
                        backgroundColor: colors2
                    });
                    chart2.update();
                // FIN CHIFFRE D'AFFAIRE DE VETEMENTS
                // DEBUT STOCK DU SAC
                    let labels3 = ['Banane', 'Cartable', 'Pochette', 'Coffret'];
                    let data3 = [ response.bananeStock[0] , response.cartableStock[0] , response.pochetteStock[0] , response.coffretStock[0]];
                    let colors3 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];
                    
                    chart3.data.datasets.pop();
                    chart3.data.datasets.push({
                        data: data3,
                        backgroundColor: colors3
                    });
                    chart3.update();
                // FIN STOCK DU SAC
                // DEBUT STOCK DU VETEMENTS
                    let labels4 = ['Robe', 'Tunnique', 'Short', 'Patalon'];
                    let data4 = [response.robeStock[0], response.tunniqueStock[0], response.shortStock[0], response.patalonStock[0]];
                    let colors4 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];
                    
                    chart4.data.datasets.pop();
                    chart4.data.datasets.push({
                        data: data4,
                        backgroundColor: colors4
                    });
                    chart4.update();
                // FIN STOCK DU VETEMENTS
            }
        })
    })

    $.ajax({
        url : path+'/caissier/getChartChiffreAffaireEtStock',
        type :'GET' ,
        success : function(response){
            // DEBUT CHIFFRE D'AFFAIRE DU SAC
                console.log('response.banane[0]');
                console.log(response.banane[0]);
                let labels1 = ['Banane', 'Cartable', 'Pochette', 'Coffret'];
                let data1 = [response.banane[0], response.cartable[0] , response.pochette[0], response.coffret[0]];
                let colors1 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];

                let myChart1 = document.getElementById("myChart").getContext('2d');

                chart1 = new Chart(myChart1, {
                    type: 'bar',
                    data: {
                        labels: labels1,
                        datasets: [ {
                            data: data1,
                            backgroundColor: colors1
                        }]
                    },
                    options: {
                        title: {
                            text: "CHIFFRE D'AFFAIRE TOTAL DES SACS (en Ar)",
                            display: true
                        },
                        legend: {
                          display: false
                        }
                    }
                });
            // FIN CHIFFRE D'AFFAIRE DU SAC
            // DEBUT DU CHIFFRE D'AFFAIRE DU VETEMENTS
            let labels2 = ['Robe', 'Tunnique', 'Short', 'Patalon'];
            let data2 = [ response.robe[0] , response.tunnique[0] , response.short[0] , response.patalon[0]];
            let colors2 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];
            let myChart2 = document.getElementById("myChart2").getContext('2d');
    		chart2 = new Chart(myChart2, {
                type: 'bar',
                data: {
                    labels: labels2,
                    datasets: [ {
                        data: data2,
                        backgroundColor: colors2
                    }]
                },
                options: {
                    title: {
                        text: "CHIFFRE D'AFFAIRE TOTAL DES VETEMENTS (en Ar)",
                        display: true
                    },
                    legend: {
                      display: false
                    }
                }
            });
            // FIN DU CHIFFRE D'AFFAIRE DU VETEMENTS
            // DEBUT STOCK DU SAC
            let labels3 = ['Banane', 'Cartable', 'Pochette', 'Coffret'];
            let data3 = [ response.bananeStock[0] , response.cartableStock[0] , response.pochetteStock[0] , response.coffretStock[0]];
            let colors3 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];

            let myChart3 = document.getElementById("myChart3").getContext('2d');

            chart3 = new Chart(myChart3, {
                type: 'bar',
                data: {
                    labels: labels3,
                    datasets: [ {
                        data: data3,
                        backgroundColor: colors3
                    }]
                },
                options: {
                    title: {
                        text: "STOCK TOTAL DES SACS",
                        display: true
                    },
                    legend: {
                      display: false
                    }
                }
            });
            // FIN STOCK DU SAC
            // DEBUT STOCK DU VETEMENTS
            let labels4 = ['Robe', 'Tunnique', 'Short', 'Patalon'];
            let data4 = [response.robeStock[0], response.tunniqueStock[0], response.shortStock[0], response.patalonStock[0]];
            let colors4 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF'];

            let myChart4 = document.getElementById("myChart4").getContext('2d');

            chart4 = new Chart(myChart4, {
                type: 'bar',
                data: {
                    labels: labels4,
                    datasets: [ {
                        data: data4,
                        backgroundColor: colors4
                    }]
                },
                options: {
                    title: {
                        text: "STOCK TOTAL DES VETEMENTS ",
                        display: true
                    },
                    legend: {
                      display: false
                    }
                }
            });
            // FIN STOCK DU VETEMENTS
        }
    })


})

