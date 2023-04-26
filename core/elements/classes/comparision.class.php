<?php

class Comparision
{
    public $modx;
    public $data;
    public $ctx;
    public $lists;

    public function __construct($modx, $data)
    {
        $this->modx = $modx;
        $this->data = $data;
        $this->ctx = $data['ctx'] ?: 'web';
        $this->lists = $_SESSION['compare'][$this->ctx] ?: [];
    }

    public function init()
    {
        if (!$list = $this->data['list']) {
            $msg = $this->modx->lexicon('ajaxformitlogin_compare_add_err_list');
            return ['success' => false, 'msg' => $msg];
        };
        if (!$id = $this->data['id']) {
            $msg = $this->modx->lexicon('ajaxformitlogin_compare_add_err_id');
            return ['success' => false, 'msg' => $msg];
        }
        if (isset($this->lists[$list][$id])) {
            $result = $this->removeFromComparision($id, $list);
        } else {
            $result = $this->addToComparision($id, $list);
        }

        $_SESSION['compare'][$this->ctx] = $this->lists;
        return array_merge($result, ['success' => true, 'counts' => $this->getCounts()]);
    }

    private function getCounts()
    {
        $result = ['total' => 0];
        foreach ($this->lists as $list => $ids) {
            $count = count($ids);
            $result['total'] += $count;
            if ($count) {
                $result[$list] = $count;
            } else {
                unset($_SESSION['compare'][$this->ctx][$list]);
            }

        }
        if ($result['total'] === 0) {
            unset($_SESSION['compare'][$this->ctx]);
        }
        return $result;
    }

    private function addToComparision($id, $list)
    {
        $this->lists[$list][$id] = 1;
        $msg = $this->modx->lexicon('ajaxformitlogin_compare_add_success');
        $btn_text = $this->modx->lexicon('ajaxformitlogin_compare_btn_remove');
        return ['msg' => $msg, 'btn_compare_text' => $btn_text];
    }

    private function removeFromComparision($id, $list)
    {
        unset($this->lists[$list][$id]);
        $msg = $this->modx->lexicon('ajaxformitlogin_compare_remove_success');
        $btn_text = $this->modx->lexicon('ajaxformitlogin_compare_btn_add');
        return ['msg' => $msg, 'btn_compare_text' => $btn_text];
    }
}