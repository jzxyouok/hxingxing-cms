<?php

namespace Douyasi\Http\Requests;

use Douyasi\Http\Requests\DouyasiRequest;

class PersonRequest extends Request
{

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        //return false;
        return true;
    }

    /**
     * 自定义验证规则rules
     *
     * @return array
     */
    public function rules($type = 'store')
    {
        //update
        if($this->segment(3)){
            $rules = [];
        }
        //store
        else{
            $rules = [];
        }
        return $rules;
    }

    /**
     * 自定义验证信息
     *
     * @return array
     */
    public function messages()
    {
        return [];
    }
}
