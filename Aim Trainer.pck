GDPC                �                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn`      e      �Oݗ�<LB����缾    T   res://.godot/exported/133200997/export-a0179be67c53df111b773e41a0ca2c94-HelloLua.scn�      t      >�Ƚ�2A�)�"�A	��        res://.godot/extension_list.cfg �"      '       �nsc���	��|f�N    ,   res://.godot/global_script_class_cache.cfg  �             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexp            ：Qt�E�cO���       res://.godot/uid_cache.bin  �"      ]       �#��������L߶    (   res://addons/luaAPI/luaAPI.gdextension          �      �>e�~��	!��rԛ�       res://demo/HelloLua.gd  �      �      ������.7�v���        res://demo/HelloLua.tscn.remap  �      e       ̯�n�J���r,�       res://icon.svg  �      �      k����X3Y���f       res://icon.svg.import   �      �       �(�dqH�w�.�j�       res://main.tscn.remap   @      a       �J�Sw� ������       res://project.binary #      �       ���]�=�֦�N�o$       res://scripts/lua.gd      ^      ��^)�?c۠�=�8�        [configuration]
entry_symbol = "luaAPI_library_init"
compatibility_minimum = 4.2

[libraries]
linux.x86_64.debug = "bin/libluaapi.linux.template_debug.x86_64.so"
linux.x86_64.release = "bin/libluaapi.linux.template_release.x86_64.so"
linux.x86_32.debug = "bin/libluaapi.linux.template_debug.x86_32.so"
linux.x86_32.release = "bin/libluaapi.linux.template_release.x86_32.so"

windows.x86_64.debug = "bin/libluaapi.windows.template_debug.x86_64.dll"
windows.x86_64.release = "bin/libluaapi.windows.template_release.x86_64.dll"
windows.x86_32.debug = "bin/libluaapi.windows.template_debug.x86_32.dll"
windows.x86_32.release = "bin/libluaapi.windows.template_release.x86_32.dll"

android.debug.x86_64 = "bin/libluaapi.android.template_debug.x86_64.so"
android.release.x86_64 = "bin/libluaapi.android.template_release.x86_64.so"
android.debug.arm64 = "bin/libluaapi.android.template_debug.arm64.so"
android.release.arm64 = "bin/libluaapi.android.template_release.arm64.so"

macos.debug = "bin/libluaapi.macos.template_debug.universal.dylib"
macos.release = "bin/libluaapi.macos.template_release.universal.dylib"

ios.debug.arm64 = "bin/libluaapi.ios.template_debug.arm64.dylib"
ios.release.arm64 = "bin/libluaapi.ios.template_release.arm64.dylib"
ios.debug.simulator = "bin/libluaapi.ios.template_debug.universal.simulator.dylib"
ios.release.simulator = "bin/libluaapi.ios.template_release.universal.simulator.dylib"
            extends Node

var lua: LuaAPI = LuaAPI.new()

func _lua_print(message: String):
	print(message)

func _ready():
	# All builtin libraries are available to bind with. Use Debug, OS and IO at your own risk.
	lua.bind_libraries(["base", "table", "string"])

	lua.push_variant("print", _lua_print)
	lua.push_variant("message", "Hello lua!")

	# Most methods return a LuaError in case of an error
	var err: LuaError = lua.do_string("""
	for i=1,10,1 do
		print(message)
	end
	function get_message()
		return "Hello gdScript!"
	end
	""")
	if err is LuaError:
		print("ERROR %d: %s" % [err.type, err.message])
		return
	
	var ret = lua.call_function("get_message", [])
	if ret is LuaError:
		print("ERROR %d: %s" % [ret.type, ret.message])
		return
	print(ret)
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://demo/HelloLua.gd ��������      local://PackedScene_eb6rs          PackedScene          	         names "      	   HelloLua    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC            extends Node

var lua: LuaAPI = LuaAPI.new()

func _LUA_print(message: String):
	print(message)
	
class LUA_Plugin:
	var player = LUA_Player.new()

class LUA_Player:
	var can_move = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var plugin = LUA_Plugin.new()
	lua.push_variant("print", _LUA_print)
	
	lua.do_string("""
		function init(plugin)
			print("hello world!")
		end
	""")
	
	var initFn = lua.pull_variant("init")
	if (initFn != null):
		initFn.call()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
  GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
2#�E.@$���A.T�p )��#L��;Ev9	Б )��D)�f(qA�r�3A�,#ѐA6��npy:<ƨ�Ӱ����dK���|��m�v�N�>��n�e�(�	>����ٍ!x��y�:��9��4�C���#�Ka���9�i]9m��h�{Bb�k@�t��:s����¼@>&�r� ��w�GA����ը>�l�;��:�
�wT���]�i]zݥ~@o��>l�|�2�Ż}�:�S�;5�-�¸ߥW�vi�OA�x��Wwk�f��{�+�h�i�
4�˰^91��z�8�(��yޔ7֛�;0����^en2�2i�s�)3�E�f��Lt�YZ���f-�[u2}��^q����P��r��v��
�Dd��ݷ@��&���F2�%�XZ!�5�.s�:�!�Њ�Ǝ��(��e!m��E$IQ�=VX'�E1oܪì�v��47�Fы�K챂D�Z�#[1-�7�Js��!�W.3׹p���R�R�Ctb������y��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T�� ���0���}�x^�����.�s�l�>�.�O��J�d/F�ě|+^�3�BS����>2S����L�2ޣm�=�Έ���[��6>���TъÞ.<m�3^iжC���D5�抺�����wO"F�Qv�ږ�Po͕ʾ��"��B��כS�p�
��E1e�������*c�������v���%'ž��&=�Y�ް>1�/E������}�_��#��|������ФT7׉����u������>����0����緗?47�j�b^�7�ě�5�7�����|t�H�Ե�1#�~��>�̮�|/y�,ol�|o.��QJ rmϘO���:��n�ϯ�1�Z��ը�u9�A������Yg��a�\���x���l���(����L��a��q��%`�O6~1�9���d�O{�Vd��	��r\�՜Yd$�,�P'�~�|Z!�v{�N�`���T����3?DwD��X3l �����*����7l�h����	;�ߚ�;h���i�0�6	>��-�/�&}% %��8���=+��N�1�Ye��宠p�kb_����$P�i�5�]��:��Wb�����������ě|��[3l����`��# -���KQ�W�O��eǛ�"�7�Ƭ�љ�WZ�:|���є9�Y5�m7�����o������F^ߋ������������������Р��Ze�>�������������?H^����&=����~�?ڭ�>���Np�3��~���J�5jk�5!ˀ�"�aM��Z%�-,�QU⃳����m����:�#��������<�o�����ۇ���ˇ/�u�S9��������ٲG}��?~<�]��?>��u��9��_7=}�����~����jN���2�%>�K�C�T���"������Ģ~$�Cc�J�I�s�? wڻU���ə��KJ7����+U%��$x�6
�$0�T����E45������G���U7�3��Z��󴘶�L�������^	dW{q����d�lQ-��u.�:{�������Q��_'�X*�e�:�7��.1�#���(� �k����E�Q��=�	�:e[����u��	�*�PF%*"+B��QKc˪�:Y��ـĘ��ʴ�b�1�������\w����n���l镲��l��i#����!WĶ��L}rեm|�{�\�<mۇ�B�HQ���m�����x�a�j9.�cRD�@��fi9O�.e�@�+�4�<�������v4�[���#bD�j��W����֢4�[>.�c�1-�R�����N�v��[�O�>��v�e�66$����P
�HQ��9���r�	5FO� �<���1f����kH���e�;����ˆB�1C���j@��qdK|
����4ŧ�f�Q��+�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cgw8no5fwjt4k"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scripts/lua.gd ��������      local://PackedScene_s0s7c          PackedScene          	         names "         Node3D    script    	   variants                       node_count             nodes     	   ��������        ����                    conn_count              conns               node_paths              editable_instances              version             RSRC           [remap]

path="res://.godot/exported/133200997/export-a0179be67c53df111b773e41a0ca2c94-HelloLua.scn"
           [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              ���8CB�H   res://icon.svg�������   res://main.tscn���2�   res://demo/HelloLua.tscn   res://addons/luaAPI/luaAPI.gdextension
         ECFG      application/config/name         Aim Trainer    application/run/main_scene         res://main.tscn    application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg               