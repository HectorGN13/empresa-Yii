<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'usuario') ?>
    <?= $form->field($model, 'email') ?>
    <?= $form->field($model, 'contraseña') ?>
    <div class="form-group">
        <?= Html::submitButton('Enviar', ['class' => 'btn btn-primary']) ?>
    </div>
<?php ActiveForm::end(); ?>
