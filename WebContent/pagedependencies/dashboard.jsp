
	<script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
	<script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>


   <!--   <script type="text/javascript" src="assets/js/plugins/maps/jvectormap/jvectormap.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/maps/jvectormap/map_files/world.js"></script>
	<script type="text/javascript" src="assets/js/plugins/maps/jvectormap/map_files/countries/usa.js"></script>
	<script type="text/javascript" src="assets/js/plugins/maps/jvectormap/map_files/countries/germany.js"></script>
	<script type="text/javascript" src="assets/demo_data/maps/vector/gdp_demo_data.js"></script>-->

	<script type="text/javascript" src="assets/js/core/app.js"></script>
		<!-- <script type="text/javascript" src="assets/js/maps/vector/vector_maps_demo.js"></script>  -->
	<!-- <script type="text/javascript" src="assets/js/pages/dashboard.js"></script> -->
		

	<script type="text/javascript" src="assets/js/plugins/ui/ripple.min.js"></script>
	<script
					src="${pageContext.request.contextPath}/vendors/echarts/dist/echarts.min.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/echarts/map/js/world.js"></script>
	<script
					src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
				<!-- NProgress -->
				<script
					src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
				<!-- Chart.js -->
				<script
					src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>

				<!-- gauge.js -->
				<script
					src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
				<!-- bootstrap-progressbar -->
				<script
					src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
				<!-- iCheck -->
				<script
					src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
				<!-- Skycons -->
				<script
					src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
				<!-- Flot -->
				<script
					src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
				<!-- Flot plugins -->
				<script
					src="${pageContext.request.contextPath}/production/js/flot/jquery.flot.orderBars.js"></script>
				
				<script
					src="${pageContext.request.contextPath}/production/js/flot/jquery.flot.spline.js"></script>
				<script
					src="${pageContext.request.contextPath}/production/js/flot/curvedLines.js"></script>
				<!-- JQVMap -->
				<script
					src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
				<script
					src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
				<!-- bootstrap-daterangepicker -->
				<script
					src="${pageContext.request.contextPath}/vendors/echarts/dist/echarts.min.js"></script>
				
				<script>
		var sample_data = {${data}};
    $(document).ready(function(){
        $('#world-map-gdp').vectorMap({
            map: 'world_en',
            backgroundColor: null,
            color: '#ffffff',
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: true,
            showTooltip: true,
            values: sample_data,
            scaleColors: ['#E6F2F0', '#149B7E'],
            normalizeFunction: 'polynomial'
        });
      });
    
      var theme = {
          color: [
              '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
              '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
          ],
          title: {
              itemGap: 8,
              textStyle: {
                  fontWeight: 'normal',
                  color: '#408829'
              }
          },
          dataRange: {
              color: ['#1f610a', '#97b58d']
          },
          toolbox: {
              color: ['#408829', '#408829', '#408829', '#408829']
          },
          tooltip: {
              backgroundColor: 'rgba(0,0,0,0.5)',
              axisPointer: {
                  type: 'line',
                  lineStyle: {
                      color: '#408829',
                      type: 'dashed'
                  },
                  crossStyle: {
                      color: '#408829'
                  },
                  shadowStyle: {
                      color: 'rgba(200,200,200,0.3)'
                  }
              }
          },
          dataZoom: {
              dataBackgroundColor: '#eee',
              fillerColor: 'rgba(64,136,41,0.2)',
              handleColor: '#408829'
          },
          grid: {
              borderWidth: 0
          },
          categoryAxis: {
              axisLine: {
                  lineStyle: {
                      color: '#408829'
                  }
              },
              splitLine: {
                  lineStyle: {
                      color: ['#eee']
                  }
              }
          },
          valueAxis: {
              axisLine: {
                  lineStyle: {
                      color: '#408829'
                  }
              },
              splitArea: {
                  show: true,
                  areaStyle: {
                      color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
                  }
              },
              splitLine: {
                  lineStyle: {
                      color: ['#eee']
                  }
              }
          },
          timeline: {
              lineStyle: {
                  color: '#408829'
              },
              controlStyle: {
                  normal: {color: '#408829'},
                  emphasis: {color: '#408829'}
              }
          },
          k: {
              itemStyle: {
                  normal: {
                      color: '#68a54a',
                      color0: '#a9cba2',
                      lineStyle: {
                          width: 1,
                          color: '#408829',
                          color0: '#86b379'
                      }
                  }
              }
          },
          map: {
              itemStyle: {
                  normal: {
                      areaStyle: {
                          color: '#ddd'
                      },
                      label: {
                          textStyle: {
                              color: '#c12e34'
                          }
                      }
                  },
                  emphasis: {
                      areaStyle: {
                          color: '#99d2dd'
                      },
                      label: {
                          textStyle: {
                              color: '#c12e34'
                          }
                      }
                  }
              }
          },
          force: {
              itemStyle: {
                  normal: {
                      linkStyle: {
                          strokeColor: '#408829'
                      }
                  }
              }
          },
          chord: {
              padding: 4,
              itemStyle: {
                  normal: {
                      lineStyle: {
                          width: 1,
                          color: 'rgba(128, 128, 128, 0.5)'
                      },
                      chordStyle: {
                          lineStyle: {
                              width: 1,
                              color: 'rgba(128, 128, 128, 0.5)'
                          }
                      }
                  },
                  emphasis: {
                      lineStyle: {
                          width: 1,
                          color: 'rgba(128, 128, 128, 0.5)'
                      },
                      chordStyle: {
                          lineStyle: {
                              width: 1,
                              color: 'rgba(128, 128, 128, 0.5)'
                          }
                      }
                  }
              }
          },
          gauge: {
              startAngle: 225,
              endAngle: -45,
              axisLine: {
                  show: true,
                  lineStyle: {
                      color: [[0.2, '#86b379'], [0.8, '#68a54a'], [1, '#408829']],
                      width: 8
                  }
              },
              axisTick: {
                  splitNumber: 10,
                  length: 12,
                  lineStyle: {
                      color: 'auto'
                  }
              },
              axisLabel: {
                  textStyle: {
                      color: 'auto'
                  }
              },
              splitLine: {
                  length: 18,
                  lineStyle: {
                      color: 'auto'
                  }
              },
              pointer: {
                  length: '90%',
                  color: 'auto'
              },
              title: {
                  textStyle: {
                      color: '#333'
                  }
              },
              detail: {
                  textStyle: {
                      color: 'auto'
                  }
              }
          },
          textStyle: {
              fontFamily: 'Arial, Verdana, sans-serif'
          }
      };
     
      var dataStyle = {
        normal: {
          label: {
            show: false
          },
          labelLine: {
            show: false
          }
        }
      };
      var placeHolderStyle = {
        normal: {
          color: 'rgba(0,0,0,0)',
          label: {
            show: false
          },
          labelLine: {
            show: false
          }
        },
        emphasis: {
          color: 'rgba(0,0,0,0)'
        }
      };
       
    </script>
    
	<script>
	 $('#trackerform').attr("action","Dashboard");

	    
	    function trackerchanged() {
			$(".loader").removeClass("hidden");
			document.getElementById("trackerform").submit();
			}
			function datechanged() {
				$(".loader").removeClass("hidden");
			document.getElementById("dateform").submit();
			}
	    
	    
	</script>
	