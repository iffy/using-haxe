// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__internal_renderer_ShaderBuffer
#define INCLUDED_openfl__internal_renderer_ShaderBuffer

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(lime,graphics,opengl,GLObject)
HX_DECLARE_CLASS2(lime,utils,ArrayBufferView)
HX_DECLARE_CLASS3(openfl,_internal,renderer,ShaderBuffer)
HX_DECLARE_CLASS2(openfl,display,BitmapData)
HX_DECLARE_CLASS2(openfl,display,GraphicsShader)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,Shader)
HX_DECLARE_CLASS2(openfl,display,ShaderInput_openfl_display_BitmapData)
HX_DECLARE_CLASS2(openfl,display,ShaderParameter_Bool)
HX_DECLARE_CLASS2(openfl,display,ShaderParameter_Float)
HX_DECLARE_CLASS2(openfl,display,ShaderParameter_Int)

namespace openfl{
namespace _internal{
namespace renderer{


class HXCPP_CLASS_ATTRIBUTES ShaderBuffer_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef ShaderBuffer_obj OBJ_;
		ShaderBuffer_obj();

	public:
		enum { _hx_ClassId = 0x10b40e74 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._internal.renderer.ShaderBuffer")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._internal.renderer.ShaderBuffer"); }
		static hx::ObjectPtr< ShaderBuffer_obj > __new();
		static hx::ObjectPtr< ShaderBuffer_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~ShaderBuffer_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("ShaderBuffer","\x25","\xa6","\x8f","\x08"); }

		int inputCount;
		::Array< ::Dynamic> inputRefs;
		::Array< ::Dynamic> inputFilter;
		::Array< ::Dynamic> inputMipFilter;
		::Array< ::Dynamic> inputs;
		::Array< ::Dynamic> inputWrap;
		int overrideCount;
		::Array< ::String > overrideNames;
		::Array< ::Dynamic> overrideValues;
		int paramBoolCount;
		int paramCount;
		 ::lime::utils::ArrayBufferView paramData;
		 ::lime::graphics::opengl::GLObject paramDataBuffer;
		int paramDataLength;
		int paramFloatCount;
		int paramIntCount;
		::Array< int > paramLengths;
		::Array< int > paramPositions;
		::Array< ::Dynamic> paramRefs_Bool;
		::Array< ::Dynamic> paramRefs_Float;
		::Array< ::Dynamic> paramRefs_Int;
		::Array< int > paramTypes;
		 ::openfl::display::GraphicsShader shader;
		void addOverride(::String name,::cpp::VirtualArray values);
		::Dynamic addOverride_dyn();

		void clearOverride();
		::Dynamic clearOverride_dyn();

		void update( ::openfl::display::GraphicsShader shader);
		::Dynamic update_dyn();

};

} // end namespace openfl
} // end namespace _internal
} // end namespace renderer

#endif /* INCLUDED_openfl__internal_renderer_ShaderBuffer */ 