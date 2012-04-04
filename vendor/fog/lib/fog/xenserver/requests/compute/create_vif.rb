module Fog
  module Compute
    class XenServer

      class Real
        
        def create_vif( vm_ref, network_ref )
          @connection.request({:parser => Fog::Parsers::XenServer::Base.new, :method => 'VIF.create'}, default_vif_config(vm_ref, network_ref) )
        end
        
        def default_vif_config( vm_ref, network_ref, device_number = '0' )
          {
            'MAC_autogenerated' => 'True',
            'VM' => vm_ref,
            'network' => network_ref,
            'device' => device_number,
            'MAC' => '',
            'MTU' => '0',
            'other_config' => {},
            'qos_algorithm_type' => 'ratelimit',
            'qos_algorithm_params' => {}
          }
        end
      end
      
      class Mock
        
        def create_vif( vm_ref, network_ref )
          Fog::Mock.not_implemented
        end
        
      end

    end
  end
end
