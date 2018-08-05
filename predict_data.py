import os
import datetime
import tensorflow as tf
from utils import get_checkpoint, predictions2text

load_train = 5
input_data = [10,26,19.5,49.5,53,12,21,177,81,0.00122297,0.001272777,0.003633808,0,0.000251661,0.000962313,0.000858712,0.000965985,0.000664824,0.000974896,0.000787556,-0.001091223,0.000920056,0.000346385,-0.004008665,-0.002049021,-0.001670158,0.000334426,0.000586457,-8.69E-05,0.000466944,0.000580232,0.000844801,0.000656559,0.000794175,-0.001267871,-0.001259827,-0.001473301,-0.001175485,-0.002098548,-0.001956671,0.000776992,0.000702512,-8.52E-05,0.000478453,3.49E-05,-0.003344434,-0.001962121,0.000296385,3.30E-05,-0.00100847,-0.000669281,-0.000594342,-0.001043554,-0.001034813,0.001860547,0.001980521,0.002155106,0.002209323,0.00222787,0.002190097,-0.006788185,0.002169621,0.001911162,0.002223896,0.002074434,-0.001103965,0.002227833,0.001949796,0.002103429,0.00220776,0.002194314,0.002139916,0.00212127,0.002015026,0.000355978,0.00035276,0.000352002,0.000345417,0.000351694,0.000347553,0.00017702,0.000115396,0.000300689,0.00025339,-2.71E-05,-0.000450502,-0.000285991,5.65E-06,-3.84E-05,-0.000180804,-0.000139978,-0.000132902,-0.000193443,-0.000195009,0.000709869,0.000751436,0.000729455,0.000657475,0.000716187,0.000672071,0.000779217,0.000693756,0.000768394,0.000707527,0.000765797,0.000770746,0.000764953,0.000756165,0.000769598,0.000757875,0.000752697,0.000735108,0.000746754,0.000736672]
# The labels are:
#   pie_izquierdo: False
#   pie_derecho: False
#   rodilla_izquierda: False
#   rodilla_derecha: False
#   cadera: true
#   columna: False

TRAIN_DIR = os.path.join('Training', 'train_{}'.format(load_train))
MODEL_DIR = get_checkpoint(TRAIN_DIR)
if MODEL_DIR is not None:
    data_predictions = {'pie_izquierdo': 0, 'pie_derecho': 0, 'rodilla_izquierda': 0,
                        'rodilla_derecha': 0, 'cadera': 0, 'columna': 0}
    predictions = {}
    with tf.Session() as sess:
        new_saver = tf.train.import_meta_graph('{}.meta'.format(MODEL_DIR))
        new_saver.restore(sess, MODEL_DIR)
        for key in data_predictions.keys():
            predictions[key] = tf.get_collection('predictions_{}'.format(key))
            data_predictions[key] = sess.run(predictions[key], feed_dict={'input_data:0': [input_data],
                                                                          'keep_prob:0': 1})[0]
        print(predictions2text(predictions_dict=data_predictions))
else:
    print('{0} | There is no checkpoint in {1}. Finishing program.'.format(datetime.datetime.now(),
                                                                           TRAIN_DIR))
