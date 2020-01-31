<?php


namespace app\models;

use yii\base\Model;

class EntryForm extends Model
{
    public $usuario;
    public $email;
    public $contraseña;

    public function rules()
    {
        return [
          [['usuario', 'email','contraseña'], 'required'],
          ['email', 'email'],
        ];
    }
}
